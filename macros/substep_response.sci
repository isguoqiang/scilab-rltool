function substep_response(g_closedloop)
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
// Authors
//   Holger Nahrstaedt -  2010
//   Ishan Pendharkar - 2001-2007
//
// function plots step response in subplot.
global gridon;
global tstep;
global tmax;
if roots(denom(g_closedloop))<>[] then,
			t=0:2*tstep:tmax;
                        try
                        resp=LinearSimulate('step',t,g_closedloop,0*t',[1e-12 1e-12]);
			catch
                        messagebox(['Convergence problem.';'Please reduce your step size in Settings-->Dynamic Response.';'Unable to simulate step response']);
                        return;
                        end;
                        if tmax<1e-4 then,
			plot2d([1e6*t'],[resp],logflag='nn');
			xtitle('Step Response','Time (Micro sec)','Magnitude')
			else
			plot2d([t'],[resp],logflag='nn');
			xtitle('Step Response','Time (sec)','Magnitude');
			end;
				if gridon==1 then xgrid(4); end; // gridon==1 means grid on.
			
			
end;
//return

endfunction
