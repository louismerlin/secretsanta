const nodemailer = require('nodemailer')
const shuffle = require('shuffle-array')
const read = require('./readAsync')
let { people } = require('./people.json')
const { subject, text } = require('./email')

async function main () {
  do {
    const names = shuffle(people.map(({ name }) => name))
    people = people.map((p, i) => ({ ...p, chosen: names[i] }))
  } while (people.some(person => {
    const chosenHimself = person.chosen === person.name
    const notAllowed = person.not && person.not.some(n => n === person.chosen)
    return (chosenHimself || notAllowed)
  }))

  const host = await read({ prompt: 'Email host (e.g. smtp.gmail.com): ' })
  const user = await read({ prompt: 'Address: ' })
  const pass = await read({ prompt: 'Password: ', silent: true })

  const mailer = nodemailer.createTransport({ host, auth: { user, pass } })

  people.forEach(({ email, name, chosen }) => {
    mailer.sendMail({
      from: `"Secret Santa" <${user}>`,
      to: email,
      subject,
      text: text(name, chosen)
    })
  })

}

main()
