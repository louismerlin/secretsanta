module.exports = {
  subject: 'Your secret santa match !!',
  text: (name, chosen) => `
    Hi ${name} !

    Your secret santa match this year is ${chosen}.

    With love,
    Santa
  `
}
