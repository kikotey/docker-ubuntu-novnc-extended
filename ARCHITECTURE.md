Docker Multi-Stage builds 
=========================

see: https://shahbhargav.medium.com/docker-multi-stage-build-3d1af8868ac0



Multi-stage builds are a new feature requiring Docker ≥ 17.05

![alttext](./1%20zEhVBwQmSYOfWONtBf7CMQ.webp)


Multi-Stage build — optimized Dockerfile

Why we need multi-stage build?
------------------------------

One of the most challenging things about building images is keeping the image size down. For that we have to be careful while moving from one environment to another environment and we needed to keep tracks of artifacts, traditionally these can be achieved using shell scripts. (shell script at the rescue 😄 ).

Apart from that, Maintaining two or more `dockerfile` for application is not ideal. Multi-stage build simplifies this situation.

What is multi-stage build?
--------------------------

Multi-stage builds are a new feature requiring Docker 17.05 or higher on the daemon and client. Multistage builds are useful to anyone who has struggled to optimize Dockerfiles while keeping them easy to read and maintain.

With multi-stage builds, you use multiple `FROM`statements in your Dockerfile. Each `FROM`instruction can use a different base, and each of them begins a new stage of the build. You can selectively copy artifacts from one stage to another, leaving behind everything you don’t want in the final image.

`COPY --from=0 /src/app .`

In the above instruction, we are using stage 0 to copy artifacts and leaving everything else behind. But, numbering stage, let’s just say not easy to read. We can name our build stage as

`FROM nginx:latest AS dev`

`COPY --from=dev /src/app .`

**Command Guide — Visual Studio Code Intelligence**

![alttext](./1%20QGh2zAxi0dhrG9W3pAD83A.webp)


Control over a build — Stop at a specific build stage
-----------------------------------------------------

When you build your image, you don’t necessarily need to build the entire Dockerfile including every stage. You can specify a target build stage. This is useful when Debugging a specific build stage.

`$ docker build --target test .`

This will build image till mention target stage and stop.

When using multi-stage builds, you are not limited to copying from stages you created earlier in your Dockerfile. The Docker client pulls the image from the registry (like docker hub) if necessary and copies the artifact from there.

`COPY --from=nginx:alpine /usr/share/nginx/html/ .`

TIP: When performing multi-stage builds, all images are built sequentially and kept in the local image cache. If you want to build let’s say production environment build only then you have to delete unwanted intermediate stage build images from local image cache.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

![alttext](./1%20ZkDvMFmDIDO9-8Ac9-uuIQ.webp)


Thank you for reading.
----------------------

\--

\--

[More from Bhargav Shah](/?source=post_page-----3d1af8868ac0--------------------------------)
---------------------------------------------------------------------------------------------
