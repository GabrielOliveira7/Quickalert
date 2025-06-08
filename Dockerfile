FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar arquivo de projeto e restaurar dependências
COPY src/ProjetoAPI/ProjetoAPI.csproj src/ProjetoAPI/
RUN dotnet restore "src/ProjetoAPI/ProjetoAPI.csproj"

# Copiar APENAS o código fonte do projeto
COPY src/ProjetoAPI/ src/ProjetoAPI/

# Publicar aplicação
RUN dotnet publish "src/ProjetoAPI/ProjetoAPI.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
RUN adduser --disabled-password --gecos '' appuser
WORKDIR /home/app
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:5000
COPY --from=build /app/publish .
USER appuser
EXPOSE 5000
ENTRYPOINT ["dotnet", "PlataformaRespostaDesastres.dll"]