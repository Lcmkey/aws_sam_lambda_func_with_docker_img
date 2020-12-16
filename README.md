# aws_sam_lambda_func_with_docker_img


## Build source code

```
$ npm run build
```

## Build Docker image

```properties
$ make build

<!-- OR -->

$ docker build -t docker_lambda_handler .

```

## Create ECR

```properties
$ aws ecr create-repository --repository-name docker_lambda_handler --image-scanning-configuration scanOnPush=true
```

## Deployed to ECR

```properties
$ docker tag docker_lambda_handler:latest <accountID>.dkr.ecr.<region>.amazonaws.com/docker_lambda_handler:latest

$ aws ecr get-login-password | docker login --username AWS --password-stdin <accountID>.dkr.ecr.us-east-1.amazonaws.com

$ docker push <accountID>.dkr.ecr.<region>.amazonaws.com/docker_lambda_handler:latest
```

Invoking container image as a Lambda function

Once the image is pushed to the ECR, you can use it in a new Lambda function. In the Lambda console, choose `Create function`, and then select the new container image in the Basic information panel. Choose `Create function` to finish the process.


## Using AWS SAM to automate the process


1. Enter sam init to start the AWS SAM wizard.

2. Choose ‘1 – AWS Quick Start Templates’.

3. You have a choice of zip or image deployment. Choose 2 – Image.

4. You can select your preferred runtime base image. In this case, choose 1 – amazon/nodejs12.x-base.

5. For Project name, enter ‘my-sam-function’. This creates a sample project complete with an AWS SAM template, README file, and unit tests.

6. Install `Faker` 
   ```properties
   $ npm i faker
   ```

7. Navigate into the hello-world function directory in the my-sam-function project, and open the app.js. Paste the builded 'app.js' cooding to file and save the changed:

8. With the terminal in the my-sam-function project directory, build the project:

```properties
$ sam build
```


9. Deploy the container-based function using the guided mode of AWS SAM deployment:

```properties
$ sam deploy –guided
```

After the deployment is complete, the new functions appears in the Lambda console. You can invoke the function by using the Test options used earlier.

# Others

### List fist 5 image 
```properties
$ docker images | head -5
```