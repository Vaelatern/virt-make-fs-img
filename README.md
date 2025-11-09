# virt-make-fs as an image

I use this to prepare disk images for virtual machines, normally read-only.

## Quickstart:

```
touch input/make-available-to-image
make
```

## More

`make build` only builds the container

Changing arguments to `virt-make-fs`:

```
ARGS= make
```

Testing what we have:

```
VERBOSE=yes make
```

Use podman


```
DOCKER=podman make
```
