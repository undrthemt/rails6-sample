const { environment } = require('@rails/webpacker')

module.exports = environment

/**
 * あらゆるpackでjQueryなどを利用する
 *
 * jQueryのような依存関係を多くのpackで使う必要が生じた場合、それらをpackごとにいちいちrequireするのは面倒です。
 * 私好みのソリューションは、設定を変えて全packで利用可能にすることです（繰り返しますが、あくまでpack内での話であり、ビューでは使えません）。
 * このスニペットによって、WebpackはjQueryモジュールを$という名前を介して全packに「提供」します。これは、各packの冒頭に以下を追加するのと同等です。
 * import $ from 'jquery';
 * @link https://techracho.bpsinc.jp/hachi8833/2020_01_17/85943
 */
const webpack = require('webpack')
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)
