
import 'source.dart';
class Sourcesresponse {
	final String? status;
	final List<Source>? sources;

	const Sourcesresponse({this.status, this.sources});

	factory Sourcesresponse.fromJson(Map<String, dynamic> json) {
		return Sourcesresponse(
			status: json['status'] as String?,
			sources: (json['sources'] as List<dynamic>?)
						?.map((e) => Source.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}


}
