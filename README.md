Aby uruchomić projekt potrzebujesz:
```
Ruby: 3.1.1
NodeJS: 14.15.0
```
Kolejnym krokiem jest instalacja niezbędnych narzędzi:
```
git
yarn
```
A także bibliotek:
```
bundle install
yarn install
```
Ostatni krok to stworzenie bazy danych:
```
rails db:create
```
Po więcej szczegółów zapraszam na:
- [Windows 10](https://gorails.com/setup/windows/10)
- [Mac OSx](https://gorails.com/setup/osx/11-big-sur)
- [Linux](https://gorails.com/setup/ubuntu/21.04)

Aplikację startujemy poprzez wpisanie komendę
```
./bin/dev
```
Alternatywą jest uruchomienie poniższych 3 komend (każdej w osobnym oknie/tabie/panelu)
```
rails server -p 3000
yarn build --watch
yarn build:css --watch
```

Jeśli wszystko się udało powinieneś zobaczyć następujący wydok odwiedzając stronę `localhost:3000`:
<img width="1137" alt="image" src="https://user-images.githubusercontent.com/18404037/159790311-df15b090-c0cc-4f37-97bd-24e54ef22eb9.png">
