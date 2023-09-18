# Bash Decrypter
Decrypter for https://github.com/KasRoudra/k-fuscator

When I wrote the `decode.fish`, I didn't know which encrypter was used so I wrote it manually; seems like the encoder itself has decoding features as well.


Usage:
```bash
./decode.fish init    # initial decode
./decode.fish base64  # decode the rest of them
```

Attention: in the "base64" mode, make sure you're not decoding the last one that doesn't look like basse64, because IT WILL RUN THE SCRIPT, and if the script is malicous, then bad things happend.
