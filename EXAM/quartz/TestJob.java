package quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class TestJob implements Job {
	/**
	 * Job interface 구현체 Job의 trigger 실행 시 execute() Method는 scheduler의 스레드 중 하나에 의해
	 * 호출
	 *
	 * @param JobExecutionContext 런타임 환경에 대한 정보, 이 환경을 실행한 Scheduler에 대한 핸들, 실행을
	 *                            트리거한 트리거에 대한 핸들, 작업의 JobDetail 개체 및 기
	 */
	
	//아래 public이 붙은 이유: interface의 추상메서드에는 public이 붙음
	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		System.out.println("스케쥴러가 시작되었음");
		System.out.println();
	}
	
}





