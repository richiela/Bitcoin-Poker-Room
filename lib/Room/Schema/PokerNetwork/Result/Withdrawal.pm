package Room::Schema::PokerNetwork::Result::Withdrawal;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "FrozenColumns",
  "FilterColumn",
  "EncodedColumn",
  "Core",
);
__PACKAGE__->table("withdrawal");
__PACKAGE__->add_columns(
  "withdrawal_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "user_serial",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "currency_serial",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "amount",
  { data_type => "FLOAT", default_value => undef, is_nullable => 0, size => 32 },
  "dest",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "processed",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "info",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "created_at",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
  "processed_at",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
);
__PACKAGE__->set_primary_key("withdrawal_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-27 11:47:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zBp+6xGtv50a4dieZcH+zw

__PACKAGE__->add_columns(
  "processed_at",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
    datetime_undef_if_invalid => 1,
  },
);

__PACKAGE__->has_one(
  'currency' => 'Room::Schema::PokerNetwork::Result::Currencies',
  { 'foreign.serial' => 'self.currency_serial' },
);

__PACKAGE__->has_one(
  'user' => 'Room::Schema::PokerNetwork::Result::Users',
  { 'foreign.serial' => 'self.user_serial' },
);


=head1 AUTHOR

Pavel Karoukin

=head1 LICENSE

Copyright (C) 2010 Pavel A. Karoukin <pavel@yepcorp.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=cut

1;
