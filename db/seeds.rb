user1 = User.create(name: 'Usuário 1', email: 'usuario1@usuario.com', password: '123456',
  password_confirmation: '123456')
user2 = User.create(name: 'Usuário 2', email: 'usuario2@usuario.com', password: '123456',
  password_confirmation: '123456')
user3 = User.create(name: 'Usuário 3', email: 'usuario3@usuario.com', password: '123456',
  password_confirmation: '123456')

# Videos
  Video.create(name: 'Star Wars', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user1)
  Video.create(name: 'Caminhão da Fuleragem', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user1)
  Video.create(name: 'Doidão do Asfalto', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user1)
  Video.create(name: 'Banda de Merda', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user1)
  Video.create(name: 'Come Queto', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user1)
  Video.create(name: 'Vamo Que Vamo Galera', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user2)
  Video.create(name: 'Estamos Fazendo A Coisa Certa', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user2)
  Video.create(name: 'Perdidos Na Noite', url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
    user: user3)
