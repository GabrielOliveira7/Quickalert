FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar apenas o arquivo de projeto primeiro
COPY src/ProjetoAPI/ProjetoAPI.csproj src/ProjetoAPI/

# Verificar o conteúdo do arquivo .csproj
RUN cat src/ProjetoAPI/ProjetoAPI.csproj

# Forçar a restauração com verbosidade
RUN dotnet restore "src/ProjetoAPI/ProjetoAPI.csproj" --verbosity normal

# Copiar o resto dos arquivos
COPY . .

# Verificar o conteúdo do Program.cs para debug
RUN cat src/ProjetoAPI/Program.cs

# Publicar com verbosidade
RUN dotnet publish "src/ProjetoAPI/ProjetoAPI.csproj" -c Release -o /app/publish --verbosity normal

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
RUN adduser --disabled-password --gecos '' appuser
WORKDIR /home/app
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:5000
COPY --from=build /app/publish .
USER appuser
EXPOSE 5000
ENTRYPOINT ["dotnet", "PlataformaRespostaDesastres.dll"]