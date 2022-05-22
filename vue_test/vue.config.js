const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer:{
    // open: true,
    // 没法实现自动打开chrome
    // app: {
    //   name: 'google-chrome',
    // },
    proxy:{
      '/api': {
        target: 'https://api.youqianshan.com',
        changeOrigin: true
      },
    }
  },
  lintOnSave:false,
})
