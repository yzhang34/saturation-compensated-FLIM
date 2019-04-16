function plot_offline_K(handles)
%PLOT_OFFLINE_K Summary of this function goes here
%
%   Author: Yide Zhang
%   Email: yzhang34@nd.edu
%   Date: April 16, 2019
%   Copyright: University of Notre Dame, 2019

    
    %% plotting options
    line_width = 2;
    font_size = 11;
    marker_size = 10;
    % Set colormap for the plotting
    num_cc = 10;
    cc = lines(num_cc);
    cc(3,:)=[]; % not use yellow
    % 1 - blue
    % 2 - orange
    % 3 - purple
    % 4 - green
    % 5 - cyan
    % 6 - red
    
    lifetime_min = 0e-6;
    lifetime_max = 5e-6;
    lifetime_ref = 1.6e-6;
   
    %% parameter setting   
    
    % data source
    str_Data = get(handles.Popup_Data, 'String');
    val_Data = get(handles.Popup_Data, 'Value');
    switch str_Data{val_Data};
    case 'Data1'
        load power_sweep_data_1.mat
    case 'Data2'
        load power_sweep_data_2.mat
    end
    
    
    % K coefficient
    K_max = str2double(get(handles.Edit_K_max, 'String'));
    K_min = str2double(get(handles.Edit_K_min, 'String'));
    set(handles.Slider_K, 'Max', K_max)
    set(handles.Slider_K, 'Min', K_min)
    
    
    K = str2double(get(handles.Edit_K, 'String'));


    % log Exc plot or not
    do_log = get(handles.Checkbox_Exc, 'Value');
    
    % Reference lifetime plot or not
    do_ref = get(handles.Checkbox_Ref, 'Value');
    
    % Convert Exc voltage to Power or not
    do_power = get(handles.Checkbox_Power, 'Value');
    
    if do_power
        % convert Uvolt (Exc) to Pmeter
        Pmeter = 49.16 * Exc - 1.312;
        % convert Pmeter to Pfocal (Exc)
        Exc = 0.5571 * Pmeter + 2.017;
    end
    
    
    f_mod = 62500;
    w = 2*pi * f_mod;
    

    p1 = p1_mag .* exp(1i*p1_ang);
    pq1 = pq1_mag .* exp(1i*pq1_ang);
    ppq1 = K * p1 - 2 * pq1;


    
    %% lfetime calculation
    % 1w
    non_sat_1w = tan(p1_ang - q1_ang) / (1 * w);
    sat_1w = tan(angle(ppq1) - q1_ang) / (1 * w);
    
    
    % Exc-Lifetime
    if do_log
        h = semilogx(handles.Axes_Lifetime, Exc, non_sat_1w, '.', Exc, sat_1w, '.');
    else
        h = plot(handles.Axes_Lifetime, Exc, non_sat_1w, '.', Exc, sat_1w, '.');
    end
    ylabel(handles.Axes_Lifetime, 'Lifetime (s)')
    if do_power
        xlabel(handles.Axes_Lifetime, 'Focal excitation power (mW)')
    else
        xlabel(handles.Axes_Lifetime, 'Averaged excitation voltage (V)')
    end
    xlim(handles.Axes_Lifetime, [min(Exc) max(Exc)])
    ylim(handles.Axes_Lifetime, [lifetime_min lifetime_max])
    set(handles.Axes_Lifetime, 'FontSize',font_size);
    set(h,'linewidth',line_width);
    set(h,'markersize',marker_size);
    legend(handles.Axes_Lifetime, 'Non-saturated', 'Saturated')
    if do_ref
        hl = line([min(Exc) max(Exc)], [lifetime_ref lifetime_ref], 'Parent', handles.Axes_Lifetime);
        set(hl,'linewidth',line_width);
        set(hl,'color',cc(3,:));
        set(hl,'linestyle','--');   
    end
    
    


end

