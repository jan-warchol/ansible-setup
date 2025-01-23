### 1. Getting username in ansible.

`ansible_user` variable must be defined in the inventory or host variables.
`ansible_user_id` variable is set to the username that ansible actually connects with (e.g. based on ssh configuration). However:
  a) it requires gathering facts
  b) we need to use username in password lookup, so we need something available before gathering facts (or we'd have to set it inside the play which would be very cumbersome)


### `sudo su` vs `sudo -i` etc

I need to understant the exact difference, which one is better for security (and why), and how to deal with common annoying use-cases when I would want to use them.