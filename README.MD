# Fooocus LA-Z
This is a docker image of lllyasviel/Fooocus by a lazy person.

It's tailored for Truenas Scale/Truecharts Custom App, but you can do whatever I guess.

Gradio wants to treat code as data, let it be so.
Mount /app and /.cache as PVC, ~~/app/fooocus/outputs as hostpath~~ (i give up, into the pvc it goes).
~~ORDER MATTERS(?), mount /app first.~~
