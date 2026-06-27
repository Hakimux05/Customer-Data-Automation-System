import csv
from datetime import datetime
import mysql.connector
from mysql.connector import Error

FAIL_CSV = "file_report.csv"
LAPORAN_PROSES_TXT = "laporan_proses.txt"

def connect_db():
    try:
        conn = mysql.connector.connect(
            host = "localhost",
            user = "root",
            password = "",
            database = "automasi"
        )
        if conn.is_connected():
            return conn
    except Error as e:
        print(f"Database Error: {e}")
        return None

def baca_semua_data():
    data = []
    conn = connect_db()
    
    if not conn:
        return data
    
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM user")
        hasil = cursor.fetchall()
        
        for baris in hasil:
            baris["id"] = int(baris["id"])
            baris["jumlah_belanja"] = float(baris["jumlah_belanja"])
            data.append(baris)
            
    except Error as e:
        print(f"Ralat Read Data: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()
            
    return data

def tambah_rekod(nama, emel, jumlah_belanja, kategori):
    conn = connect_db()
    if not conn:
        return None
    
    tarikh = datetime.now().strftime("%Y-%m-%d")
    sql = """INSERT INTO user(nama, emel, jumlah_belanja, kategori, tarikh_daftar) 
             VALUES (%s, %s, %s, %s, %s)"""
    nilai = (nama, emel, jumlah_belanja, kategori, tarikh)
    
    try:
        cursor = conn.cursor()
        cursor.execute(sql, nilai)
        conn.commit()
        return cursor.lastrowid
    except Error as e:
        print(f"Ralat Tambah Rekod: {e}")
        conn.rollback()
        return None
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

def kemaskini_rekod(id_pelanggan, nama, emel, jumlah_belanja, kategori):
    conn = connect_db()

    if not conn:
        return False

    sql = """
    UPDATE user
    SET nama=%s,
        emel=%s,
        jumlah_belanja=%s,
        kategori=%s
    WHERE id=%s
    """

    nilai = (nama, emel, jumlah_belanja, kategori, id_pelanggan)

    try:
        cursor = conn.cursor()
        cursor.execute(sql, nilai)
        conn.commit()

        if cursor.rowcount > 0:
            return True
        else:
            return False

    except Error as e:
        print(f"Ralat Update: {e}")
        conn.rollback()
        return False

    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

def padam_rekod(id_pelanggan):
    conn = connect_db()

    if not conn:
        return False

    sql = "DELETE FROM user WHERE id=%s"

    try:
        cursor = conn.cursor()
        cursor.execute(sql, (id_pelanggan,))
        conn.commit()

        if cursor.rowcount > 0:
            return True
        else:
            return False

    except Error as e:
        print(f"Ralat Delete: {e}")
        conn.rollback()
        return False

    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

def kira_statistik(data):
    jumlah_pelanggan = len(data)
    jumlah_belanja_keseluruhan = sum(r["jumlah_belanja"] for r in data)
    
    kategori_aktif = sum(1 for r in data if r["kategori"].lower() == "aktif")
    kategori_biasa = sum(1 for r in data if r["kategori"].lower() == "biasa")
    
    pelanggan_vip = [r for r in data if r["jumlah_belanja"] >= 500]
    
    return {
        "jumlah_pelanggan": jumlah_pelanggan,
        "jumlah_belanja": f"RM {jumlah_belanja_keseluruhan:.2f}",
        "pelanggan_aktif": kategori_aktif,
        "pelanggan_biasa": kategori_biasa,
        "jumlah_vip": len(pelanggan_vip),
        "senarai_vip": pelanggan_vip
    }

def jana_laporan_teks(statistik):
    masa = datetime.now().strftime("%d-%m-%Y %H:%M:%S")
    kandungan = f"""
-------------------------------------
        LAPORAN RINGKASAN PELANGGAN
Dijana pada: {masa}
Sumber Data: MySQL Database
-------------------------------------
RINGKASAN UTAMA:
- Jumlah Pelanggan: {statistik['jumlah_pelanggan']} orang
- Jumlah Nilai Belanja: {statistik['jumlah_belanja']}
- Pelanggan Aktif: {statistik['pelanggan_aktif']} orang
- Pelanggan Biasa: {statistik['pelanggan_biasa']} orang
- Pelanggan VIP (belanja ≥ RM500): {statistik['jumlah_vip']} orang
"""
    with open(LAPORAN_PROSES_TXT, mode='w', encoding='utf-8') as f:
        f.write(kandungan)
    return LAPORAN_PROSES_TXT

def jana_laporan_csv(senarai_vip):
    with open(FAIL_CSV, mode='w', newline='', encoding='utf-8') as f:
        penulis = csv.writer(f)
        penulis.writerow(["ID", "Nama", "Emel", "Jumlah Belanja (RM)", "Kategori", "Tarikh Daftar"])
        for org in senarai_vip:
            tarikh_str = org["tarikh_daftar"].strftime("%Y-%m-%d") if isinstance(org["tarikh_daftar"], datetime) else str(org["tarikh_daftar"])
            penulis.writerow([
                org["id"],
                org["nama"],
                org["emel"],
                f"{org['jumlah_belanja']:.2f}",
                org["kategori"],
                tarikh_str
            ])
    return FAIL_CSV

def papar_menu():
    print("\n===== SISTEM AUTOMASI DATA (MySQL) =====")
    print("1. Tambah Rekod Baru")
    print("2. Lihat Semua Data")
    print("3. Kemaskini Rekod")
    print("4. Padam Rekod")
    print("5. Jana Laporan (TXT + CSV)")
    print("6. Keluar")

def main():
    print("Sistem bersedia. Sambungan ke MySQL diaktifkan.")
    while True:
        papar_menu()
        pilihan = input("Masukkan pilihan anda: ").strip()

        if pilihan == "1":
            nama = input("Nama pelanggan: ").strip()
            emel = input("Alamat emel: ").strip()
            try:
                belanja = float(input("Jumlah belanja (RM): ").strip())
                if belanja < 0:
                    print("Nilai tidak boleh negatif!")
                    continue
            except ValueError:
                print("Sila masukkan nombor sahaja!")
                continue
            kategori = input("Kategori (Aktif/Biasa): ").strip().capitalize()
            id_baru = tambah_rekod(nama, emel, belanja, kategori)
            if id_baru:
                print(f"Rekod ditambah dengan ID: {id_baru}")

        elif pilihan == "2":
            data = baca_semua_data()
            if not data:
                print("ℹTiada data dalam sistem.")
                continue
            print("\n--- SENARAI DATA ---")
            for r in data:
                print(f"ID: {r['id']} | Nama: {r['nama']} | Belanja: RM {r['jumlah_belanja']:.2f} | Kategori: {r['kategori']}")

        elif pilihan == "3":
            try:
                id_pelanggan = int(input("Masukkan ID pelanggan untuk dikemaskini: ").strip())
            except ValueError:
                print("ID mesti nombor!")
                continue
            nama = input("Nama baru: ").strip()
            emel = input("Emel baru: ").strip()
            try:
                belanja = float(input("Jumlah belanja baru (RM): ").strip())
                if belanja < 0:
                    print("Nilai tidak boleh negatif!")
                    continue
            except ValueError:
                print("Sila masukkan nombor sahaja!")
                continue
            kategori = input("Kategori baru (Aktif/Biasa): ").strip().capitalize()

            berjaya = kemaskini_rekod(id_pelanggan, nama, emel, belanja, kategori)
            if berjaya:
                print("Rekod berjaya dikemaskini!")
            else:
                print("ID tidak dijumpai atau ralat berlaku.")

        elif pilihan == "4":
            try:
                id_pelanggan = int(input("Masukkan ID pelanggan untuk dipadam: ").strip())
            except ValueError:
                print("ID mesti nombor!")
                continue
            sah = input(f"Anda pasti mahu padam ID {id_pelanggan}? (Y/N): ").strip().upper()
            if sah == "Y":
                berjaya = padam_rekod(id_pelanggan)
                if berjaya:
                    print("Rekod berjaya dipadam!")
                else:
                    print("ID tidak dijumpai atau ralat berlaku.")
            else:
                print("Pembatalan dipadam.")

        elif pilihan == "5":
            data = baca_semua_data()
            if not data:
                print("ℹTiada data untuk dijana laporan.")
                continue
            statistik = kira_statistik(data)
            fail_txt = jana_laporan_teks(statistik)
            fail_csv = jana_laporan_csv(statistik["senarai_vip"])
            print(f"Laporan TXT disimpan: {fail_txt}")
            print(f"Laporan CSV disimpan: {fail_csv}")

        elif pilihan == "6":
            print("Sistem ditutup")
            break

        else:
            print("Sila cuba lagi.")

if __name__ == "__main__":
    main()