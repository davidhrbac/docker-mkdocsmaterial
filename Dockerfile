FROM python:latest

LABEL io.openshift.s2i.scripts-url="image:///var/documentation/s2i"

RUN pip install mkdocs-material mkdocs-redirects mkdocs-minify-plugin mkdocs-git-revision-date-localized-plugin

WORKDIR /var/documentation
COPY s2i/ /var/documentation/s2i
RUN chmod -R 777 /var/documentation

# Compatible with OCP v.4 builder
USER 1001

# Only used when executed manually. OCP builder executes /var/documentation/s2i/assemble. See LABEL io.openshift.s2i.scripts-url
CMD ["mkdocs build", "/var/documentation", "/var/documentation/html"]

