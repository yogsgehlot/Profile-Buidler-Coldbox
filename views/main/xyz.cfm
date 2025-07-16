<!--- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Resume | FAANG Style</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      font-size: 14px;
      line-height: 1.6;
      background-color: #fdfdfd;
      color: #212121;
      padding: 2rem;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      padding: 2rem;
      box-shadow: 0 0 20px rgba(0,0,0,0.08);
      border-radius: 8px;
    }

    h1 {
      font-size: 28px;
      margin-bottom: 0.2rem;
    }

    h2 {
      font-size: 16px;
      color: #444;
    }

    .section {
      margin-top: 2rem;
    }

    .section h3 {
      border-bottom: 1px solid #ccc;
      padding-bottom: 0.3rem;
      margin-bottom: 1rem;
      font-size: 16px;
      color: #222;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .job, .project, .edu {
      margin-bottom: 1rem;
    }

    .title {
      font-weight: bold;
      color: #111;
    }

    .meta {
      font-style: italic;
      color: #666;
      font-size: 13px;
    }

    ul {
      padding-left: 1rem;
      list-style-type: disc;
    }

    .skills {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem;
    }

    .skill-badge {
      background: #e0e0e0;
      border-radius: 12px;
      padding: 0.3rem 0.75rem;
      font-size: 13px;
    }

    @media print {
      body {
        padding: 0;
      }

      .container {
        box-shadow: none;
        border: none;
      }
    }
  </style>
</head>
<cfoutput>
<body>
  <!--- #writeDump(prc)# --->
  <div class="container">
    <header>
      <h1>#user.data.firstName# #user.data.lastName#</h1>
      <!--- <h2>Software Engineer | johndoe@gmail.com | linkedin.com/in/johndoe | github.com/johndoe</h2> --->
    </header>

    <!--- <section class="section">
      <h3>Summary</h3>
      <p>Experienced full-stack engineer with 5+ years building scalable applications. Strong in React, Node.js, and AWS. Passionate about clean code and performance optimization.</p>
    </section> --->

    <section class="section">
      <h3>Education</h3>
      <cfloop query="education.data">
        <div class="edu">
          <div class="title">#education.data.degree#</div>
          <div class="meta">#education.data.institution#, #dateFormat(education.data.start_year, 'yyyy')# -
                                        #dateFormat(education.data.end_year, 'yyyy')#</div>
        </div>
      </cfloop>
    </section>

    <section class="section">
      <h3>Experience</h3>
      <cfloop query="experience.data">
        <div class="job">
          <div class="title">#experience.data.job_title#</div>
          <div class="meta">#experience.data.company_name# | #experience.data.start_year# - #experience.data.end_year EQ "" ? "Present" : experience.data.end_year#</div>
          <!--- <p>#prc.experience.data.description#</p> --->
        </div>
      </cfloop>
      
    </section>

    <section class="section">
      <h3>Projects</h3>
      <cfloop query="projects.data">
        <div class="project">
          <div class="title">#projects.data.project_title#</div>
          <div class="meta">#Replace("#projects.data.tech_stack#", ",", " | ", "All")#</div>
          <p>#projects.data.description#</p>
        </div>
      </cfloop>
    </section>

    <section class="section">
      <h3>Skills</h3>
      <div class="skills">
        <cfloop query="skills.data">
          <div class="skill-badge">#skills.data.skill_name#</div>
        </cfloop>
      </div>
    </section>

    
  </div>
</body>
</html>
</cfoutput> --->


<style>
  .nav-pills .nav-link {
    border-radius: 50px;
    transition: all 0.3s ease-in-out;
    font-weight: 500;
  }

  .nav-pills .nav-link:hover {
    background-color: #0d6efd;
    color: #fff;
  }

  .nav-pills .nav-link.active {
    background-color: #0d6efd;
    color: #fff;
    box-shadow: 0 0 10px rgba(13, 110, 253, 0.3);
  }

  .tab-content {
    transition: all 0.5s ease;
  }
</style>



<!-- Tab Navigation -->
