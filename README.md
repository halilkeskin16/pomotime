# Odak Pomo 🍅

**Minimalist ve Oyunlaştırılmış Pomodoro Zamanlayıcısı ile Odaklanma Sürenizi Sanal Ödüle Dönüştürün!**

[![Flutter Versiyonu](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Lisans: MIT](https://img.shields.io/badge/Lisans-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Proje Hakkında

Odak Pomo, popüler **Pomodoro Tekniği**'ni kullanarak verimliliğinizi artırmanıza ve zamanınızı daha etkili yönetmenize yardımcı olmak için tasarlanmış modern bir mobil uygulamadır. Sadece bir zamanlayıcı olmanın ötesinde, tamamladığınız her odaklanma seansı için sizi sanal "Coin"lerle ödüllendirerek süreci oyunlaştırır ve motivasyonunuzu yüksek tutar.

Bu proje, Flutter ve Firebase'in gücünü bir araya getirerek hem temiz bir kullanıcı arayüzü hem de güvenli bir veri yönetimi sunmayı hedefler.

## 🚀 Temel Özellikler

* **Esnek Pomodoro Zamanlayıcısı:** Ayarlanabilir çalışma ve mola süreleri.
* **Kullanıcı Sistemi:** Firebase Authentication ile güvenli kullanıcı kaydı ve girişi.
* **Coin Kazanma:** Tamamlanan her Pomodoro seansı ile sanal coin kazanımı.
* **Bulut Senkronizasyonu:** Cloud Firestore sayesinde coinleriniz her zaman güvende ve tüm cihazlarınızdan erişilebilir.
* **Modern ve Sade Arayüz:** Göz yormayan, odaklanmayı kolaylaştıran minimalist tasarım.
* **Cihaz Ayarları:** `SharedPreferences` ile tema ve süre gibi kişisel ayarları lokalde saklama.
* **Profesyonel Mimari:** Özellik odaklı (Feature-Driven) klasör yapısı ve Provider ile state management.

## 🛠️ Kullanılan Teknolojiler

Bu proje aşağıdaki teknolojiler ve paketler kullanılarak geliştirilmiştir:

* **[Flutter](https://flutter.dev/)**: Ana UI çatısı.
* **[Dart](https://dart.dev/)**: Programlama dili.
* **[Provider](https://pub.dev/packages/provider)**: State management (durum yönetimi) için.
* **[Firebase Core](https://pub.dev/packages/firebase_core)**, **[Firebase Auth](https://pub.dev/packages/firebase_auth)**, **[Cloud Firestore](https://pub.dev/packages/cloud_firestore)**: Kullanıcı kimlik doğrulama ve bulut veritabanı için.
* **[Shared Preferences](https://pub.dev/packages/shared_preferences)**: Cihaza özel basit ayarları saklamak için.

## ⚙️ Kurulum ve Başlatma

Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları izleyin.

1.  **Ön Koşullar:**
    * Flutter SDK'nın kurulu olduğundan emin olun. [Flutter Kurulum Rehberi](https://flutter.dev/docs/get-started/install)

2.  **Projeyi Klonlayın:**
    ```sh
    git clone [https://github.com/](https://github.com/)[SENİN_GITHUB_KULLANICI_ADIN]/[PROJENİN_REPO_ADI].git
    cd [PROJENİN_REPO_ADI]
    ```

3.  **Paketleri Yükleyin:**
    ```sh
    flutter pub get
    ```

4.  **Firebase Kurulumu:**
    * Bir Firebase projesi oluşturun.
    * Uygulamanızı Firebase projesine kaydedin (Android & iOS için).
    * Firebase tarafından sağlanan `google-services.json` (Android için) ve `GoogleService-Info.plist` (iOS için) dosyalarını projenizdeki doğru konumlara ekleyin. Bu dosyalar `.gitignore` içinde olmalıdır ve public repoya gönderilmemelidir.

5.  **Uygulamayı Çalıştırın:**
    ```sh
    flutter run
    ```

## 🧭 Yol Haritası

Projenin gelecekteki hedefleri ve planlanan özellikleri:

* [x] Temel Pomodoro zamanlayıcı mantığı
* [x] Firebase ile kullanıcı girişi ve coin veritabanı
* [x] Tamamlanan seanslar için coin kazanma
* [ ] Coin'lerin harcanabileceği **Market** ekranı (Google Play Kodu vb. ödüller)
* [ ] Ödüllü Reklam entegrasyonu (2x Coin kazanma)
* [ ] Detaylı kullanıcı istatistikleri (Toplam odaklanma süresi, kazanılan coinler vb.)
* [ ] Zamanlayıcı bitişi için sesli bildirimler ve ayarları
* [ ] Tema seçenekleri (Açık/Koyu Mod)

## 🤝 Katkıda Bulunma

Katkılarınız projeyi daha iyi bir hale getirecektir! Lütfen `CONTRIBUTING.md` dosyasını okuyarak katkıda bulunma adımlarını öğrenin.

1.  Projeyi Fork'layın.
2.  Yeni bir özellik dalı oluşturun (`git checkout -b feature/YeniHarikaOzellik`).
3.  Değişikliklerinizi Commit'leyin (`git commit -m 'Yeni bir harika özellik eklendi'`).
4.  Dalınızı Push'layın (`git push origin feature/YeniHarikaOzellik`).
5.  Bir Pull Request açın.

## 📄 Lisans

Bu proje **MIT Lisansı** ile lisanslanmıştır. Daha fazla bilgi için `LICENSE` dosyasına göz atın.

---

**Geliştiren:** [Halil İbrahim KESKİN] - [github.com/halilkeskin16]
