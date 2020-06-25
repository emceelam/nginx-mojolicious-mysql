#!/usr/bin/env perl

use Mojolicious::Lite;
use DBI;

my $dbh = DBI->connect(
  "DBI:mysql:database=hello_database;host=hello_mysql", 'root', 'foobar')
  or die "Could not connect";

# shortcut for use in template
helper db => sub { $dbh };

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

get '/hello' => sub {
  my $c = shift;
  $c->render(template => 'hello');
};

get '/hello_world' => sub {
  my $c = shift;
  $c->render(text => 'hello, world');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<ul>
  <li><%= link_to 'hello html' => '/hello' %>.</li>
  <li><%= link_to 'hello text' => '/hello_world' %>.</li>
</ul>

@@ hello.html.ep
% layout 'default';
% title 'Hello';
% my $sth = db->prepare('SELECT street, city, state, zip FROM addresses');
% $sth->execute;
<h1>Hello</h1>
<p>Hello, World, we are reading from database: </p>
<ul>
% while (my $row = $sth->fetchrow_arrayref) {
%   my ($street, $city, $state, $zip) = @$row;
    <li><%= join (', ', $street, $city, $state, $zip) %></li>
% }
</ul>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
