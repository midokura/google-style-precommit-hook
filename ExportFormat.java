package com.midokura.sts.operations.business.exportformat;

import java.util.UUID;
import lombok.Builder;
import lombok.NonNull;
import lombok.Value;

@Value
@Builder
public class ExportFormat {

  @NonNull UUID id;

  @NonNull String name;

  @NonNull String version;

  @NonNull String extension;
}
