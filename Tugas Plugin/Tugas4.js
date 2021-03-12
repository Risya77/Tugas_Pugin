let mahasiswa = {
    nama : 'Aulia Rizqisyarifa',
    kelas : '3D',
    alamat : 'Jl. Angsana Raya, Mejasem Barat, Tegal',
    tampilkan : function(){
        alert('nama : '+this.nama),
        alert('kelas : '+this.kelas),
        alert('alamat : '+this.alamat),
        alert('hobi : '+this.hobi)
       
    }
};
let mahasiswa1 = Object.create(mahasiswa);
mahasiswa1.tampilkan();

let mahasiswa2 = Object.create(mahasiswa);
mahasiswa2.nama = 'Arwinda';
mahasiswa2.kelas = '3C';
mahasiswa2.alamat = '....';
mahasiswa2.hobi = 'masak';
mahasiswa2.tampilkan();


