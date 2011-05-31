## Portfolio

A simple rails portfolio display app with imgur integration.

### What is it for?

Designers, photographers, illustrators, and many other types of artists have a common need for a way to display
their work to potential clients/buyers/employers. This app has a splash page, an index showing links to some galleries,
and those galleries themselves; it's a very common format for such a site.

But maintaining those sites can be a pain - they typically are static sites which require manual editing and content 
management, template sites with no real flexibility, or hosted sites without much individuality.

### How does it work?

Portfolio is intended to be used with Heroku's free level of service (it's just a rails app though, so you can host
it almost anywhere) and Imgur's free (or paid) account for image hosting. Imgur organizes pictures into galleries,
lets you set captions, resizes large images, and generates thumbnails, and it's all accessible via a well-designed api.

This app is so simple because it doesn't have to implement much of the management aspect of such a site - imgur
handles all of that. The first time you visit the app, it redirects you to a page where you can put in an
imgur username and password (don't re-use a password, it's stored in cleartext), and an email address.
It immediately logs into the given imgur account, fetches metadata for all the images in the relevant galleries,
and updates itself to show all those images.

If you configure heroku's cron addon, it'll rebuild automatically (the free cron level is 'daily'), but you can go
to the `/rebuild` url for a button to trigger a rebuild manually. It will only allow a manual rebuild every 5 
minutes, to prevent trivial DOS attacks.

Changing your imgur password will cause the app to reset to empty the next time it updates, giving you the setup
screen again - you can associate it with a new imgur account, or give the new password.

### This site is pretty ugly...

Sure is! There's no styling (or content) at all; any artist is going to want their own styling and bio.

The app is built with sass and haml, an example app with styling and content will be finished fairly soon.
