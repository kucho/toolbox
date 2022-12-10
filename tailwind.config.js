module.exports = {
  darkMode: 'media',
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.rb',
    './app/frontend/**/*.rb',
    './app/frontend/**/*.html.erb',
    './app/frontend/**/*.css',
    './app/frontend/**/*.js',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './node_modules/flowbite/**/*.js'
  ],
  plugins: [
      require('flowbite/plugin')
  ],
  theme: {
  }
}