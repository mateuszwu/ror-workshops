Before we get started, you have to install:
```
Ruby: 3.1.1
NodeJS: 14.15.0
```
Another step is to install the essential tools:
```
git
yarn
```
And also the libraries:
```
bundle install
yarn install
```
Last but not least is to create a database:
```
rails db:create
```
For some more details, I suggest you to visit:
- [Windows 10](https://gorails.com/setup/windows/10)
- [Mac OSx](https://gorails.com/setup/osx/11-big-sur)
- [Linux](https://gorails.com/setup/ubuntu/21.04)

The application can be started by running the following command:
```
./bin/dev
```
As an alternative, you can run below 3 commands (each in a separate window/tab/panel)
```
rails server -p 3000
yarn build --watch
yarn build:css --watch
```

If all went well you should see the following page by visiting `localhost:3000`:
<img width="1137" alt="image" src="https://user-images.githubusercontent.com/18404037/159790311-df15b090-c0cc-4f37-97bd-24e54ef22eb9.png">
