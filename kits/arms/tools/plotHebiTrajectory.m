function [ fig ] = plotTrajectory( trajectory, dt, figNum )
%PLOTTRAJECTORY Visualize the output of HebiTrajectory.
%
%   [ fig ] = plotTrajectory( traj, dt, figNum )
%
%   TRAJECTORY is a trajectory object generated by HEBITRAJECTORYGENERATOR.
%
%   DT (optional) is the timestep used for plotting, in seconds. Defualt
%   value if not specified is .001 seconds.
%
%   FIGNUM (optional) is the figure number to use for plotting.  If a 
%   figure with this number exists it will be overwritten.  If not 
%   specified a new figure will be automatically generated.
%
%   Dave Rollinson
%   Nov 2017

    if nargin < 3 || isempty(figNum)
        fig = figure;
    else
        fig = figure(figNum);
    end
    
    if nargin < 2 || isempty(dt)
        dt = .001;
    end
    
    time = 0:dt:trajectory.getDuration();
    waypointTime = trajectory.getWaypointTime();
    
    [pos,vel,acc] = trajectory.getState(time);
    [wayPos,wayVel,wayAcc] = trajectory.getState(waypointTime);
    
    ax = subplot(3,1,1);
    plot(time,pos);
    hold on;
    ax.ColorOrderIndex = 1;
    plot(waypointTime,wayPos,'o');
    hold off;
    title('Trajectory Profile');
    ylabel('position (rad)');
    xlabel('time (sec)');
    grid on;
    legend(strsplit(num2str(1:size(pos,2))));

    ax = subplot(3,1,2);
    plot(time,vel);
    hold on;
    ax.ColorOrderIndex = 1;
    plot(waypointTime,wayVel,'o');
    hold off;
    ylabel('velocity (rad/sec)');
    xlabel('time (sec)');
    grid on;

    ax = subplot(3,1,3);
    plot(time,acc);
    hold on;
    ax.ColorOrderIndex = 1;
    plot(waypointTime,wayAcc,'o');
    hold off;
    ylabel('acceleration (rad/sec^2)');
    xlabel('time (sec)');
    grid on;

end

