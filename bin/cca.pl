#!/usr/bin/perl -wT
#
#  CCA is licensed under the BSD license. You can find the template
#  (which was used to produce this one) at the open source initiative
#  homepage (http://www.opensource.org/licenses/bsd-license.html).
#
#  Copyright (c) 2002, Hans Spaans. All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in
#      the documentation and/or other materials provided with the
#      distribution.
#    * Neither the name of Hans Spaans nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR
#  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
#  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
#  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#  Application : Cisco Config Anonymizer
#  Version     : 0.2.1
#  Author      : Hans Spaans
#  Purpose     : Remove things you won't want to show third-parties.
#  Note        : This is just a quick and dirty hack, so we may have
#                forgotten somethings.
#

use strict;

while (<STDIN>) {
	chomp;

	s/^(.*enable secret \d+ )\S+$/$1********/i;
	s/^(.*standby \d+ authentication ).+$/$1********/i;
	s/^(.*ip ospf authentication-key \d ).+$/$1********/i;
	s/^(.*password \d+ ).+$/$1********/i;
	s/^(.*snmp-server community )\S+( R.+)$/$1********$2/i;
	s/^(.*snmp-server community )\S+( view )\S+( R.+)$/$1********$2********$3/i;
	s/^(.*snmp-server host \d+\.\d+\.\d+\.\d+ ).+$/$1********/i;
	s/^(.*set password ).+$/$1********/i;
	s/^(.*set enablepass ).+$/$1********/i;
	s/^(.*set snmp community read.+ )\S+$/$1********/i; 
	s/^(.*set snmp trap \d+\.\d+\.\d+\.\d+.* )\S+$/$1********/i; 
	s/^(.*username )\S+( privilege \d+ password \d+ ).+$/$1********$2********/i; 
	s/^(.*tacacs-server key ).+$/$1********/i; 
	s/^(.*! Last configuration change at .+ by ).+$/$1********/i; 
	s/^(.*! NVRAM config last updated at .+ by ).+$/$1********/i; 

	print "$_\n";
}
