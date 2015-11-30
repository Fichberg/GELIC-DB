create table membros(
    id serial unique not null,
    email varchar(254) primary key,
    senha char(32) not null,
    nome varchar(255),
    login varchar(20) unique not null,
    data_criacao date not null, 
    is_super boolean default false,
    is_admin boolean default false
  );

  insert into membros(
    email,
    senha,
    nome,
    login,
    data_criacao
  ) values (
    'admin@gelic.com.br',
    md5('mudeme'),
    'Administrador',
    'admin',
    now()
  );

  create table administradores(
    email varchar(254) primary key references membros(email) on delete cascade on update cascade
  );

insert into administradores(
  email
) values (
  'admin@gelic.com.br'
);

alter table membros add email_admin varchar(254) references administradores(email) on delete set null on update cascade;

update membros set email_admin = 'admin@gelic.com.br', is_super = true, is_admin = true where email = 'admin@gelic.com.br';

alter table membros alter column email_admin set not null;

create table paises(
  id serial unique not null,
  nome varchar(50) primary key
);

create table estados(
  id serial unique not null,
  nome varchar(50),
  nome_pais varchar(50) references paises on update cascade,
  constraint estados_pk primary key (nome, nome_pais)
);

create table cidades(
  id serial unique not null,
  nome varchar(50),
  nome_pais varchar(50) references paises on update cascade,
  nome_estado varchar(50),
  constraint cidades_pk primary key (nome, nome_pais),
  constraint cidades_estados_fk foreign key (nome_estado, nome_pais) references estados (nome, nome_pais) on delete set null on update cascade
);

create table midias(
  id serial primary key,
  tipo varchar(30) not null ,
  nome varchar (50) not null,
  duracao interval not null,
  email_coletor varchar(254),
  data_gravacao date not null,
  email_admin varchar(254) default 'admin@gelic.com.br' references administradores(email) on update cascade,
  data_submissao date not null,
  id_cidade integer references cidades(id) on update cascade
);

create table transcricoes(
  id serial unique not null,
  id_midia int primary key references midias on delete cascade,
  codigo varchar(100) not null,
  comentario text,
  id_cidade integer references cidades(id) on update cascade
);

create table audios(
  id serial unique not null,
  id_midia int primary key references midias on delete cascade,
  codigo varchar(100) not null
);

create table videos(
  id serial unique not null,
  id_midia int primary key references midias on delete cascade,
  link text not null
);

create table idiomas(
  id serial primary key,
  id_midia int references midias(id),
  idioma varchar(50) not null
);

create table membro_fez_transcricao(
  email_membro varchar(254) references membros on update cascade,
  id_midia int references midias,
  constraint membro_fez_transcricao_pk primary key (email_membro, id_midia)
);

create table membro_revisou_transcricao(
  email_membro varchar(254) references membros on update cascade,
  id_midia int references midias,
  constraint membro_revisou_transcricao_pk primary key (email_membro, id_midia)
);
