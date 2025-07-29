# Stage 1: Build the Angular frontend
FROM node:18 AS build-ui
WORKDIR /app/UI

COPY UI/package.json ./
COPY UI/package-lock.json ./
RUN npm install

COPY UI/ ./
RUN npm run build -- --configuration production


# Stage 2: Build the .NET backend
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-api
WORKDIR /src

COPY API/CodePulse.API.csproj API/
RUN dotnet restore "API/CodePulse.API.csproj"

COPY . .
WORKDIR "/src/API"
RUN dotnet publish "CodePulse.API.csproj" -c Release -o /app/publish /p:UseAppHost=false


# Stage 3: Final runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# ✅ FIXED: Use correct stage name
COPY --from=build-api /app/publish .

# ✅ Serve frontend from API
COPY --from=build-ui /app/UI/dist/codepulse ./wwwroot

ENTRYPOINT ["dotnet", "CodePulse.API.dll"]
