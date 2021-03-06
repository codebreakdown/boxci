require 'spec_helper'

describe Boxci do
  describe ".project_config" do
    context "when a boxci project config instance has already been cached" do
      it "returns the cached project config instance" do
        project_config_double = double
        subject.instance_variable_set(:@project_config, project_config_double)
        expect(subject.project_config).to eq(project_config_double)
      end
    end

    context "when a boxci project config instance has NOT been cached" do
      before do
        subject.instance_variable_set(:@project_config, nil)
      end

      it "constructs a project config instance" do
        expect(Boxci::ProjectConfig).to receive(:new).and_return(double(:load => nil))
        subject.project_config
      end

      it "caches the project config instance in an instance variable" do
        project_config_double = double(:load => nil)
        allow(Boxci::ProjectConfig).to receive(:new).and_return(project_config_double)
        subject.project_config
        expect(subject.instance_variable_get(:@project_config)).to eq(project_config_double)
      end

      it "loads the project config" do
        project_config_double = double
        allow(Boxci::ProjectConfig).to receive(:new).and_return(project_config_double)
        expect(project_config_double).to receive(:load)
        subject.project_config
      end

      it "returns the cached project config instance" do
        project_config_double = double(:load => nil)
        allow(Boxci::ProjectConfig).to receive(:new).and_return(project_config_double)
        expect(subject.project_config).to eq(project_config_double)
      end
    end
  end

  describe ".global_config" do
    context "when provider config instance has already been cached" do
      it "returns the cached provider config instance" do
        global_config_double = double
        subject.instance_variable_set(:@global_config, global_config_double)
        expect(subject.global_config).to eq(global_config_double)
      end
    end

    context "when provider config instance has NOT been cached" do
      before do
        subject.instance_variable_set(:@global_config, nil)
      end

      it "constructs a provider config instance" do
        expect(Boxci::GlobalConfig).to receive(:new).and_return(double(:load => nil))
        subject.global_config
      end

      it "caches the provider config instance in an instance variable" do
        global_config_double = double(:load => nil)
        allow(Boxci::GlobalConfig).to receive(:new).and_return(global_config_double)
        subject.global_config
        expect(subject.instance_variable_get(:@global_config)).to eq(global_config_double)
      end

      it "loads the project config" do
        global_config_double = double
        allow(Boxci::GlobalConfig).to receive(:new).and_return(global_config_double)
        expect(global_config_double).to receive(:load)
        subject.global_config
      end

      it "returns the cached project config instance" do
        global_config_double = double(:load => nil)
        allow(Boxci::GlobalConfig).to receive(:new).and_return(global_config_double)
        expect(subject.global_config).to eq(global_config_double)
      end
    end
  end

  describe ".provider_config" do
    context "when the provider config instance has already been cached" do
      it "returns the cached provider config instance" do
        provider_config_double = double("provider config")
        subject.instance_variable_set(:@provider_config, provider_config_double)
        expect(subject.provider_config('aws')).to eq(provider_config_double)
      end
    end

    context "when the provider config instance has NOT been cached" do
      before do
        subject.instance_variable_set(:@provider_config, nil)
      end

      it "constructs a provider config instance" do
        expect(Boxci::ProviderConfig).to receive(:new).and_return(double(:load => nil))
        subject.provider_config('aws')
      end

      it "caches the provider config instance in an instance variable" do
        provider_config_double = double(:load => nil)
        allow(Boxci::ProviderConfig).to receive(:new).and_return(provider_config_double)
        subject.provider_config('aws')
        expect(subject.instance_variable_get(:@provider_config)).to eq(provider_config_double)
      end

      it "loads the provider config" do
        provider_config_double = double
        allow(Boxci::ProviderConfig).to receive(:new).and_return(provider_config_double)
        expect(provider_config_double).to receive(:load)
        subject.provider_config('aws')
      end

      it "returns the cached provider config instance" do
        provider_config_double = double(:load => nil)
        allow(Boxci::ProviderConfig).to receive(:new).and_return(provider_config_double)
        expect(subject.provider_config('aws')).to eq(provider_config_double)
      end
    end
  end

  describe ".default_provider" do
    context "when has a default provider" do
      before do
        allow(subject).to receive(:global_config).and_return(double(:default_provider => 'foo'))
      end

      it "returns the default provider" do
        expect(subject.default_provider).to eq('foo')
      end
    end

    context "when it does NOT have a default provider" do
      before do
        allow(subject).to receive(:global_config).and_return(double(:default_provider => nil))
      end

      it "returns boxci hard coded default provider" do
        expect(subject.default_provider).to eq(::Boxci::CLI::DEFAULT_PROVIDER)
      end
    end
  end

  describe ".project_path" do
    context "when the value is already set" do
      before do
        subject.instance_variable_set(:@project_path, "abc")
      end

      it "returns it" do
        expect(subject.project_path).to eq("abc")
      end
    end

    context "when the value is not set" do
      before do
        subject.instance_variable_set(:@project_path, nil)
        allow(File).to receive(:expand_path).and_return("/some/path")
      end

      it "gets the project path" do
        expect(File).to receive(:expand_path).and_return("/some/path")
        subject.project_path
      end

      it "sets the result to the instance variable" do
        expect(subject.project_path).to eq("/some/path")
      end
    end
  end
end
