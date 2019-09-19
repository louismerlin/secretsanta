const read = require('read')

module.exports = options => new Promise((resolve, reject) => {
  read(options, (error, result) => {
    if (error) {
      reject(error)
    } else {
      resolve(result)
    }
  })
})
