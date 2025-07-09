<cfoutput>


        <!DOCTYPE html>
        <html>
        <head>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 20px;
                    font-size: 11px;
                    line-height: 1.4;
                    color: ##333;
                }
                .header {
                    text-align: center;
                    margin-bottom: 20px;
                    border-bottom: 2px solid ##2c3e50;
                    padding-bottom: 15px;
                }
                .name {
                    font-size: 24px;
                    font-weight: bold;
                    color: ##2c3e50;
                    margin-bottom: 5px;
                }
                .contact {
                    font-size: 10px;
                    color: ##666;
                }
                .section {
                    margin-bottom: 15px;
                }
                .section-title {
                    font-size: 14px;
                    font-weight: bold;
                    color: ##2c3e50;
                    border-bottom: 1px solid ##bdc3c7;
                    padding-bottom: 3px;
                    margin-bottom: 8px;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }
                .item {
                    margin-bottom: 10px;
                }
                .item-header {
                    font-weight: bold;
                    font-size: 12px;
                }
                .item-subheader {
                    font-style: italic;
                    color: ##666;
                    font-size: 10px;
                }
                .item-description {
                    margin-top: 3px;
                    font-size: 10px;
                }
                .skills-grid {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 10px;
                }
                .skill-category {
                    margin-bottom: 8px;
                }
                .skill-category-title {
                    font-weight: bold;
                    font-size: 11px;
                    color: ##2c3e50;
                }
                .skill-list {
                    font-size: 10px;
                    color: ##555;
                }
                .date-range {
                    float: right;
                    font-size: 10px;
                    color: ##666;
                    font-style: italic;
                }
                .technologies {
                    font-size: 10px;
                    color: ##666;
                    font-style: italic;
                    margin-top: 2px;
                }
            </style>
        </head>
        <body>";
       
        html &= "
        <div class='header'>
            <div class='name'>resumeData.user.name</div>
            <div class='contact'>
                resumeData.user.email | resumeData.user.phone
            </div>
        </div>";
       
        if (arrayLen(resumeData.education) > 0) {
            html &= "<div class='section'>
                <div class='section-title'>Education</div>";
           
            for (var edu in resumeData.education) {
                var endDate = len(edu.end_date) ? dateFormat(edu.end_date, "mmm yyyy") : "Present";
                html &= "
                <div class='item'>
                    <div class='item-header'>#edu.institution#
                        <span class='date-range'>#dateFormat(edu.start_date, 'mmm yyyy')# - #endDate#</span>
                    </div>
                    <div class='item-subheader'>#edu.degree# in #edu.field_of_study#";
                    if (len(edu.gpa)) {
                        html &= " | GPA: #edu.gpa#";
                    }
                    html &= "</div>";
                    if (len(edu.description)) {
                        html &= "<div class='item-description'>#edu.description#</div>";
                    }
                html &= "</div>";
            }
            html &= "</div>";
        }
       
        if (arrayLen(resumeData.skills) > 0) {
            html &= "<div class='section'>
                <div class='section-title'>Technical Skills</div>";
           
            var skillsByCategory = {};
            for (var skill in resumeData.skills) {
                var category = len(skill.category) ? skill.category : "General";
                if (!structKeyExists(skillsByCategory, category)) {
                    skillsByCategory[category] = [];
                }
                arrayAppend(skillsByCategory[category], skill.skill_name);
            }
           
            for (var category in skillsByCategory) {
                html &= "
                <div class='skill-category'>
                    <span class='skill-category-title'>category:</span>
                    <span class='skill-list'>arrayToList(skillsByCategory[category], ', ')</span>
                </div>";
            }
            html &= "</div>";
        }
       
        if (arrayLen(resumeData.projects) > 0) {
            html &= "<div class='section'>
                <div class='section-title'>Projects</div>";
           
            for (var project in resumeData.projects) {
                var dateRange = "";
                if (len(project.start_date)) {
                    dateRange = dateFormat(project.start_date, "mmm yyyy");
                    if (len(project.end_date)) {
                        dateRange &= " - " & dateFormat(project.end_date, "mmm yyyy");
                    } else {
                        dateRange &= " - Present";
                    }
                }
               
                html &= "
                <div class='item'>
                    <div class='item-header'>#project.project_name#";
                    if (len(dateRange)) {
                        html &= "<span class='date-range'>#dateRange#</span>";
                    }
                    html &= "</div>";
                   
                    if (len(project.technologies)) {
                        html &= "<div class='technologies'>Technologies: #project.technologies#</div>";
                    }
                   
                    html &= "<div class='item-description'>#project.description#</div>";
                   
                    if (len(project.project_url) || len(project.github_url)) {
                        html &= "<div class='item-description'>";
                        if (len(project.project_url)) {
                            html &= "Live: #project.project_url# ";
                        }
                        if (len(project.github_url)) {
                            html &= "GitHub: #project.github_url#";
                        }
                        html &= "</div>";
                    }
                html &= "</div>";
            }
            html &= "</div>";
        }
       
        if (arrayLen(resumeData.achievements) > 0) {
            html &= "<div class='section'>
                <div class='section-title'>Achievements & Certifications</div>";
           
            for (var achievement in resumeData.achievements) {
                html &= "
                <div class='item'>
                    <div class='item-header'>#achievement.title#";
                    if (len(achievement.date_achieved)) {
                        html &= "<span class='date-range'>#dateFormat(achievement.date_achieved, 'mmm yyyy')#</span>";
                    }
                    html &= "</div>";
                   
                    if (len(achievement.issuer)) {
                        html &= "<div class='item-subheader'>#achievement.issuer#</div>";
                    }
                   
                    html &= "<div class='item-description'>#achievement.description#</div>
                </div>";
            }
            html &= "</div>";
        }
       
        html &= "
        </body>
        </html>";

    
 </cfoutput>