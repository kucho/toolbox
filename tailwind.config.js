module.exports = {
  darkMode: 'media',
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.rb',
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