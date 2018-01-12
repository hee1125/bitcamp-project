package bigdata3.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bigdata3.service.TemplateService;

@Controller
@RequestMapping("/mt")
public class MenuTemplateController {
	/** 필요 사항: 전체 템플릿 정보와 메뉴 정보를 불러와야 한다. **/

	@Autowired
	TemplateService templateService;

}
