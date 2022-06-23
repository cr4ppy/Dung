**Show**  

    /dung show
 
**Hide**  

    /dung hide
 
**Reset**  
    Repositions Dung to the middle of the screen  
    
    /dung reset


**Filter dungeon**\
By name and difficulty seperated by commas in the search bar at the bottom, eg.\

    sp h, mgt, mgt h, kara, za, sethekk H, deadmines, zf

English only for now, plan on having German, Russian, Chinese, Spanish.  

Only a one person project right now so reach of if you would like to contribute, please do! 

I plan on supporting the addon and adding updates and features for TBC and Season of Mastery, possibly WoTLK (depends on the dungeon finder decision blizzard make).  

Please report any issues or even feature ideas!  

**Development setup & notes**  
1. "git clone https://github.com/cr4ppy/Dung.git" into your Addons folder
2. make a pull request for any changes you do and I can update CurseForge


**Build production versions**  
1. BuildScripts/build.bat creates the new zips you need for CurseForge, they will be put in a "build" folder in the root dir (it uses powershell so windows only right now)
2. All the seperate game version .toc files are also kept in BuildScripts, make sure you update the Interface build number to the correct version of the game it's for. (Please test each version, you will need to open them anyway to get a GetBuildInfo)
