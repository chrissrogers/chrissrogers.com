const express = require('express');

express()
  .use(express.static('public'))
  .listen(process.env.PORT || 3000);
