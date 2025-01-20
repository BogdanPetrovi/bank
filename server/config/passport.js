const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt')
const db = require('../db/database')

passport.use(new LocalStrategy(
  async function(username, password, done){
    try {
      const result = await db.query("SELECT * FROM users WHERE email = $1", { username });
      if(result.rows.length > 0){
        const user = result.rows[0];
        bcrypt.compare(password, user.password, (err, user) => {
          if(err) done(err)
          if(user) done(null, user)
          done(null, false)
        })
      } else {
        done(null, false)
      }
    } catch (err) {
      done(err)
    }
  }
));
