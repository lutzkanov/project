FROM nginx:alpine

COPY ./quizz-app/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
