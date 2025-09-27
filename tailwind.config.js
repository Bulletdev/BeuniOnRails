module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'beuni-purple': '#6B46C1',
        'beuni-pink': '#EC4899',
        'beuni-orange': '#FB923C',
        'beuni-green': '#10B981',
        'beuni-blue': '#3B82F6',
      },
      borderRadius: {
        'beuni': '16px',
      },
      boxShadow: {
        'beuni': '0 4px 6px -1px rgba(107, 70, 193, 0.1), 0 2px 4px -1px rgba(107, 70, 193, 0.06)',
        'beuni-lg': '0 10px 15px -3px rgba(107, 70, 193, 0.1), 0 4px 6px -2px rgba(107, 70, 193, 0.05)',
      },
      backgroundImage: {
        'beuni-gradient': 'linear-gradient(135deg, #6B46C1 0%, #EC4899 100%)',
        'beuni-card': 'linear-gradient(135deg, #ffffff 0%, #f8fafc 100%)',
      }
    },
  },
  plugins: [],
}