function toggleItem(id) {
	var panel = document.getElementById(id);
	if(panel.className == "infocus") {
		panel.className = "nodisplay";
	} else {
		panel.className = "infocus";
	}
}

function choose_primary_class(primary_name, synergy_name_1, synergy_name_2) {
    var class_rows = document.getElementById("classes").getElementsByTagName("tr");
    var cur_class;
    //set css for all classes
    for(i=0; i<class_rows.length; i++) {
        for(j=0; j<class_rows[i].cells.length; j++) {
            cur_class = class_rows[i].cells[j];
            cur_class.className = "other_class";
        }
    }
    
    //identify the primary and synergy classes
    var primary_class = document.getElementById(primary_name);
    var synergy_class_1 = document.getElementById(synergy_name_1);
    var synergy_class_2 = document.getElementById(synergy_name_2);
    
    //set css for primary and synergy classes
    primary_class.className = "primary_class";
    synergy_class_1.className = "synergy_class";
    synergy_class_2.className = "synergy_class";
    
    var primary_skills = primary_class.getElementsByClassName("skill_count");
    for(i=0; i<primary_skills.length; i++) {
        primary_skills[i].innerHTML = "1";
    }
}

function reset_class() {
    var class_rows = document.getElementById("classes").getElementsByTagName("tr");
    var cur_class;
    for(i=0; i<class_rows.length; i++) {
        for(j=0; j<class_rows[i].cells.length; j++) {
            cur_class = class_rows[i].cells[j];
            cur_class.className = "class_panel";
        }
    }
}

function buy_skill(class_name, skill_name) {
    var skill_counter = document.getElementById(skill_name);
    var skill_level = parseInt(skill_counter.innerHTML);
    if(isNaN(skill_level)) {
        skill_level = 0;
    }
    skill_counter.innerHTML = skill_level + 1;
}