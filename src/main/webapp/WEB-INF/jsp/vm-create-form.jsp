<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--@elvariable id="virtualMachine" type="de.papke.cloud.portal.model.VirtualMachineModel"--%>

<jsp:include page="header.jsp" />

<div id="wrapper">

	<jsp:include page="navigation.jsp" />

	<div id="page-wrapper">
		<form method="post"
	                action="<c:url value="/vm/create/action" />"
	                target="output" role="form" enctype="multipart/form-data">
			<div class="row">
			    <div class="col-lg-12">
				    <h4 class="page-header">Create Virtual Machine</h4>
				    <p>All fields with an asterisk(*) are required.</p>
				</div>    
			</div>	
			<div class="row">
					<c:forEach items="${virtualMachine.providerDefaultsList}"
						var="variableGroup" varStatus="loop">
						<c:if test="${loop.index % 2 == 0}">
	                        <div class="col-lg-4">
	                    </c:if>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#${variableGroup.title}Content" class="collapsed"
										aria-expanded="false"><i class="fa fa-plus-square"
										aria-hidden="true"></i>&nbsp;<c:out
											value="${variableGroup.title}" /></a>
								</h4>
							</div>
							<div id="${variableGroup.title}Content"
								class="panel-body panel-collapse collapse in"
								aria-expanded="true" style="">
								<c:forEach items="${variableGroup.variables}" var="variable">
									<label><c:out value="${variable.title}" /><c:if test="${variable.required}">*</c:if></label>
									<c:choose>
									    <c:when test="${variable.type == 'string'}">
									       <input class="form-control" name="${variable.name}" value="${variable.defaults[0]}"<c:if test="${variable.required}"> required="required"</c:if>>
									    </c:when>
									    <c:otherwise>
										    <c:choose> 
												<c:when test="${variable.type == 'file'}">
													<input type="file" name="${variable.name}"<c:if test="${variable.required}"> required="required"</c:if>>
												</c:when>
												<c:otherwise>
												    <c:choose>
												        <c:when test="${variable.type == 'text'}">
												            <textarea name="${variable.name}" class="form-control" rows="3"<c:if test="${variable.required}"> required="required"</c:if>></textarea>
												        </c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${variable.type == 'boolean'}">
																	<br />
																	<c:choose>
																		<c:when test="${variable.defaults[0] == 'true'}">
																			<input type="checkbox" name="${variable.name}" checked="checked"<c:if test="${variable.required}"> required="required"</c:if>>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" name="${variable.name}"<c:if test="${variable.required}"> required="required"</c:if>>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																    <c:if test="${variable.type == 'list'}">
																        <select name="${variable.name}" class="form-control"<c:if test="${variable.required}"> required="required"</c:if>>
																            <c:forEach items="${variable.defaults}" var="value" varStatus="count">
																                <option<c:if test="${count.index == variable.index}"> selected="selected"</c:if>><c:out value="${value}" /></option>
																            </c:forEach>
							                                            </select>
																    </c:if>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
												    </c:choose>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									<p class="help-block">
									   <c:if test="${not empty variable.url}">
									       <a href="${variable.url}" target="_blank">
									   </c:if>
									   <c:out value="${variable.description}" />
									   <c:if test="${not empty variable.url}">
									       </a>
									   </c:if>
									</p>
								</c:forEach>
							</div>
						</div>
						<c:if test="${loop.index % 2 == 1 || loop.last}">
	                        </div>
	                    </c:if>
					</c:forEach>
	            </div>
	            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                            <h4 class="modal-title" id="myModalLabel">Output</h4>
	                        </div>
	                        <div class="modal-body">
		                        <iframe name="output" id="output" frameborder="0" scrolling="yes"></iframe>
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        <div class="row">
	            <div class="col-lg-12">				
					<input type="hidden" name="provider" value="${virtualMachine.provider}" />
					<button type="submit" id="plan" class="btn btn-warning">Plan</button>
					<button type="submit" id="apply" class="btn btn-danger">Apply</button>
					<p>&nbsp;</p>
				</div>
	        </div>			
		</div>
	</form>
</div>

<jsp:include page="footer.jsp" />