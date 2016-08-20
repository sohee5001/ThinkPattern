<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="pull-right">
		<a
			href="/notice/modify?idx=${notice.idx}&${ pagination.queryString }"
			class="btn"> <i class="icon-list"></i> ����

		</a> <a
			href="/notice/delete?idx=${notice.idx}&${pagination.queryString}"
			class="btn" data-confirm="�����Ͻðڽ��ϱ�?"> <i class="icon-remove"></i>
			����
		</a> <a href="/notice/list?${ pagination.queryString }"
			class="btn"> <i class="icon-list"></i> �������
		</a>
	</div>

	<h1>��������</h1>
	<hr />

	<div class="article-header">
		<span class="lbl">����:</span> <span class="title">${ notice.title }</span>
		<hr />
		<span class="lbl">�۹�ȣ:</span> <span class="txt">${ notice.idx}</span>
		<span class="lbl">�ۼ���:</span> <span class="txt">${ notice.userid}</span>
		<span class="lbl">��ȸ��:</span> <span class="txt">${ notice.counts }</span>
		<span class="lbl">�ۼ���</span> <span class="txt"><fmt:formatDate
				pattern="yyyy-MM-dd HH:mm" value="${  notice.crea_dtm }" /></span>
		<hr />
	</div>
	<div class="body">${ notice.contents }</div>

</div>

</body>
</html>
</body>
</html>