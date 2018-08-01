Pro Collison_item, All_data, F_Yukawa_sum
print , 'into Collison_item'
    common basic_data
    common Column
    F_Yukawa_temp1 = fltarr(All_Particle_number,All_Particle_number)
    F_Yukawa_temp2 = fltarr(All_Particle_number)
    F_Yukawa_temp3 = fltarr(All_Frame_number)
    F_Yukawa_sum   = fltarr(All_Frame_number)
    r  = fltarr(All_Particle_number,All_Particle_number)
    for iframe = 0L, All_Frame_number - 1 do begin
        for i = 0L, All_Particle_number - 1 do begin
            l1 = All_Particle_number * iframe
            for iparticle = 0L, All_Particle_number -1 do begin
                for jparticle = 0L, All_Particle_number -1 do begin
                    if iparticle Gt jparticle then begin
                        dx = abs(All_data[Coordinate_X,l1+iparticle]-(All_data[Coordinate_X,l1+jparticle]))
                        dy = abs(All_data[Coordinate_Y,l1+iparticle]-(All_data[Coordinate_Y,l1+jparticle]))
                        if dx Gt Half_Periodic_boundary_X then dx = Periodic_boundary_X - dx
                        if dy Gt Half_Periodic_boundary_Y then dy = Periodic_boundary_Y - dy
                        if dx + dy Gt 7 then break
                        r[iparticle,jparticle] = (dx^2 + dy^2)^0.5
                        F_Yukawa_temp1[iparticle,jparticle] = exp(-kappa*r[iparticle,jparticle])/r[iparticle,jparticle]*(kappa+1/r[iparticle,jparticle])
                    endif                   
                endfor
            endfor     
        F_Yukawa_temp2[i] =  (All_data[Coordinate_X,l1+i]*All_data[Velocity_X,l1+i]+All_data[Coordinate_Y,l1+i]*All_data[Velocity_Y,l1+i])*(total(F_Yukawa_temp1[i,*])+total(F_Yukawa_temp1[*,i]))
        endfor
        F_Yukawa_temp3[iframe] =  total(F_Yukawa_temp2[*])
    endfor
    F_Yukawa_sum = -0.5*(1/(4*3.1415926536)) * F_Yukawa_temp3
    print , F_Yukawa_sum
    print , 'Collison_item done'           
End