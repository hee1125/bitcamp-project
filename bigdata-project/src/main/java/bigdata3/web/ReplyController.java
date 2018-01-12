package bigdata3.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bigdata3.domain.Reply;
import bigdata3.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired ReplyService replyService;
	
	@RequestMapping("write")
	public void write(Reply reply/*, HttpSession session*/) {
//		Member member = (Member) session.getAttribute("loginInfo");
//		String memberEmail = member.getMemberName();
//		reply.setReplyer(memberEmail);
		replyService.insert(reply);
	}
	
	@RequestMapping("list")
	public String list(int boardNo, Model model) {
		List<Reply> replyList = replyService.list(boardNo);
		model.addAttribute("replyList", replyList);
		return "board/replyList";
	}
}
