/**
 * @note webpackのアセットコンパイル用
 * @link https://techracho.bpsinc.jp/hachi8833/2020_01_16/85940
 * Webpackerのデフォルト設定では以下が指定されます。
 *
 * 自分のJavaScript pack（つまりapplication.js）はapp/javascript/packs/の下に置かれること
 * ビューでJavaScript packをインクルードするにはjavascript_pack_tag '<pack名>'を使う（例: <%= javascript_pack_tag 'my_app' %>はapp/javascript/packs/my_app.jsをインクルードする）
 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

/**
 * jQueryはapplication.jsの中で利用可能な状態になるので、jQueryをapplication.jsでrequireする必要はありません。
 * すなわち、jQueryをapplication.jsの中で直接使う必要がない限り、実際にはjQueryをapplication.jsでrequireする必要はありません。
 * @link https://techracho.bpsinc.jp/hachi8833/2020_01_17/85943
 */
// require("jquery");
// require("bootstrap"); // bootstrap_custom.js を使います
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// @link https://medium.com/@guilhermepejon/how-to-install-bootstrap-4-3-in-a-rails-6-app-using-webpack-9eae7a6e2832
import './bootstrap_custom.js'
import '../stylesheets/application.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

