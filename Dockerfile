FROM wordpress

#upload
RUN echo "file_uploads = On\n" \
         "memory_limit = 500M\n" \
         "upload_max_filesize = 500M\n" \
         "post_max_size = 500M\n" \
         "max_execution_time = 600\n" \
         > /usr/local/etc/php/conf.d/uploads.ini

COPY ["wp-content/plugins","/usr/src/wordpress/wp-content/plugins"]
COPY ["wp-content/themes","/usr/src/wordpress/wp-content/themes"]

RUN chown -R www-data:www-data /usr/src/wordpress/*

