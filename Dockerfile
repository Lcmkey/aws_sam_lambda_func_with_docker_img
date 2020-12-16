FROM public.ecr.aws/lambda/nodejs:12

COPY ./lambda_handler/dist/app.js ./lambda_handler/package*.json ./
RUN npm install

CMD [ "app.lambdaHandler" ]