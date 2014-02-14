assets do

  serve '/js', from: 'assets/js'

  js :application, [
    '/js/*.js'
  ]

  serve '/css', from: 'assets/css'

  css :application, [
    '/css/bootstrap.css',
    '/css/style.css'
   ]

end
