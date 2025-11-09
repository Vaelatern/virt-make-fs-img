# virt-make-fs as an image

I use this to prepare disk images for virtual machines, normally read-only.

This is a useful way to get binaries and other files shipped in to a Windows
VM, since those VMs don't normally come with 9p support.

## Quickly Use

```
mkdir input output
touch input/this-file-should-be-accessible
touch input/and-this-file-too
docker run -v ./input:/input -v ./output:/output ghcr.io/Vaelatern/virt-make-fs-img@latest
```

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
