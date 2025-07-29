# Stage 1: Build the Angular frontend
# Use a Node.js image to build the Angular app.
FROM node:18 AS build-ui
WORKDIR /app/UI

# Copy package configuration and install dependencies
# This leverages Docker layer caching by copying only package files first.
COPY UI/package.json ./
COPY UI/package-lock.json ./
RUN npm install

# Copy the rest of the UI source code and build the app
COPY UI/ ./
# The output path is 'dist/codepulse' based on your angular.json
RUN npm run build -- --configuration production


# Stage 2: Build the .NET backend
# Use the .NET SDK image to build and publish the API.
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-api
WORKDIR /src

# Copy project files and restore dependencies
# This also leverages Docker layer caching.
COPY API/CodePulse.API.csproj API/
RUN dotnet restore "API/CodePulse.API.csproj"

# Copy the rest of the backend source code and publish
COPY . .
WORKDIR "/src/API"
RUN dotnet publish "CodePulse.API.csproj" -c Release -o /app/publish /p:UseAppHost=false


# Stage 3: Create the final production image
# Use the smaller ASP.NET runtime image.
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# Copy the published backend from the 'publish' stage
COPY --from=build-api /app/publish .

# Copy the built frontend from the 'build-ui' stage to the wwwroot folder
# The API will be configured to serve these static files.
COPY --from=build-ui /app/UI/dist ./wwwroot

RUN mkdir -p /app/Images
# Set the entry point for the application
ENTRYPOINT ["dotnet", "CodePulse.API.dll"]
