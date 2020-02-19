/**
 * @note sprockets4 のアセットコンパイル用のmanifest.js
 * @link https://techracho.bpsinc.jp/hachi8833/2020_01_16/85940
 * Sprocketsのパイプラインを用いてアセットをインクルードしたい場合は以下のようにします。
 * CSSを書く（ここではapp/assets/stylesheets/my_makeup.cssとする）
 * app/assets/config/manifest.jsでlink_treeかlink_directoryかlinkを用いて、stylesheet_link_tagでそのCSSを利用できるようにする（例: link my_makeup.css）
 * ビューにstylesheet_link_tagを書いてCSSをインクルードする（例: <%= stylesheet_link_tag 'my_makeup' %>）
 */
//
// @link https://github.com/ruby-grape/grape-swagger-rails#enabling-in-rails-6-sprokets-5
// @link https://github.com/rails/sprockets/blob/master/UPGRADING.md#manifestjs
// @todo sprocketsが3 -> 4になったことで、grape_swagger_railsのタグの読み込みが出来ない...。
//= link grape_swagger_rails/application.css
//= link grape_swagger_rails/application.js
//= link_tree ../images
//= link_directory ../stylesheets .css

